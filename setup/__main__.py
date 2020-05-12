import setup.home

print('inside main --> executing __main__.py with name {}'.format(__name__))
print()
h = home()

try:
    h.copy_home_files()
finally:
    print('file copied to home folder')

