#include "opencv2/imgcodecs.hpp"
#include "opencv2/highgui.hpp"
#include "opencv2/imgproc.hpp"
#include <iostream>

int main(int argc, char **argv)
{

    const char *filename = argc >= 2 ? argv[1] : "smarties.png";

    cv::Mat src = cv::imread(cv::samples::findFile(filename), cv::IMREAD_COLOR);

    if (src.empty()) {
        std::cout << "Error opening image" << std::endl;
        return EXIT_FAILURE;
    }

    cv::Mat gray;
    cv::cvtColor(src, gray, cv::COLOR_BGR2GRAY);

    cv::medianBlur(gray, gray, 7);
    cv::imshow("median-filtered image", gray);

    cv::Mat edge;
    cv::Canny(gray, edge, 50, 200, 3);
    cv::imshow("edge-filtered image", edge);

    std::vector<cv::Vec3f> circles;
    /*cv::HoughCircles(gray, circles, cv::HOUGH_GRADIENT, 1,
                     gray.rows / 16,
                     100, 30, 80, 150);*/
    cv::HoughCircles(gray, circles, cv::HOUGH_GRADIENT, 1,
                     gray.rows / 16,
                     100, 30, 1, 30);

    for (size_t i = 0; i < circles.size(); i++)
    {
        cv::Vec3i c = circles[i];
        cv::Point center = cv::Point(c[0], c[1]);
        cv::circle(src, center, 1, cv::Scalar(0, 0, 0), 3, cv::LINE_AA);
        int radius = c[2];
        cv::circle(src, center, radius, cv::Scalar(0, 0, 255), 3, cv::LINE_AA);

        std::cout << "Circle " << i << ": Center (" << c[0] << ", " << c[1] << "), Radius " << c[2] << std::endl;
    }

    cv::imshow("detected circles", src);
    cv::waitKey();

    return EXIT_SUCCESS;

}
