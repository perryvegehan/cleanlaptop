#!/usr/bin/env python3

import cv2

def capture_photo():
    # Create a VideoCapture object to access the camera
    capture = cv2.VideoCapture(0)

    # Capture a photo from the camera
    ret, frame = capture.read()

    # Save the photo to a file in PNG format
    cv2.imwrite('photo.png', frame)

    # Release the VideoCapture object
    capture.release()

capture_photo()
