import os
import shutil


class Home:
    def __init__(self):
        print('inside home class')

    @staticmethod
    def copy_home_files():
        original = r'D:\dev\git-hub\k8s\home\eyall\*'
        target = r'C:\Users\eyall\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc\LocalState\rootfs\home\elevy'
        shutil.copyfile(original, target)
