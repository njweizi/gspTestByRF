# -*-encoding=utf-8-*-
from PIL import Image
import pytesseract

# path = "10.png"


class ImageCodePicher(object):
    def __init__(self):
        pass

    # text = pytesseract.image_to_string(Image.open(path), lang='chi_sim')
    def binarizing(self, img, threshold):

        """传入image对象进行灰度、二值处理"""
        img = img.convert("L")  # 转灰度
        pixdata = img.load()
        w, h = img.size

        # 遍历所有像素，大于阈值的为黑色
        for y in range(h):
            for x in range(w):
                if pixdata[x, y] < threshold:
                    pixdata[x, y] = 0
                else:
                    pixdata[x, y] = 255
        # img.show()
        return img

    def depoint(self, img):
        """传入二值化后的图片进行降噪"""
        pixdata = img.load()
        w, h = img.size
        for y in range(1, h - 1):
            for x in range(1, w - 1):
                count = 0
                if pixdata[x, y - 1] > 245:    # 上
                    count = count + 1
                if pixdata[x, y + 1] > 245:    # 下
                    count = count + 1
                if pixdata[x - 1, y] > 245:    # 左
                    count = count + 1
                if pixdata[x + 1, y] > 245:    # 右
                    count = count + 1
                if pixdata[x - 1, y - 1] > 245:    # 左上
                    count = count + 1
                if pixdata[x - 1, y + 1] > 245:    # 左下
                    count = count + 1
                if pixdata[x + 1, y - 1] > 245:    # 右上
                    count = count + 1
                if pixdata[x + 1, y + 1] > 245:    # 右下
                    count = count + 1

                if count > 4:
                    pixdata[x, y] = 255
        # img.show()
        return img

    def get_txt(self, path, thread_number):
        img = Image.open(path)
        img = self.binarizing(img, thread_number)
        img = self.depoint(img)
        text = pytesseract.image_to_string(img, lang='eng').strip()
        print(text)
        return text


def picher(path, thread):
    picher = ImageCodePicher()
    return picher.get_txt(path, thread)


if __name__ == '__main__':
    picher('10.png', 250)




