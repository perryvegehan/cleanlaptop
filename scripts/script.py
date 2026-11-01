
#!/usr/bin/env python3

import cv2
import os

def capture_photo():
    capture = cv2.VideoCapture(0)

    if not capture.isOpened():
        print("Camera access unavailable.")
        return

    ret, frame = capture.read()
    capture.release()

    if not ret:
        print("Photo capture failed.")
        return

    filename = os.path.abspath("photo.png")
    cv2.imwrite(filename, frame)

    print(f"Photo saved at: {filename}")

    cv2.imshow("Your Photo - You Look Good!", frame)

    print("You look good! 😎")
    print("Close the photo window to exit.")

    while cv2.getWindowProperty(
        "Your Photo - You Look Good!",
        cv2.WND_PROP_VISIBLE
    ) >= 1:
        if cv2.waitKey(100) & 0xFF == 27:
            break

    cv2.destroyAllWindows()

capture_photo()

