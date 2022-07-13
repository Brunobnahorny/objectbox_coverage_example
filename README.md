# objectbox_coverage_example 

Flutter coverage objectbox example.

>TLDR: download objectbox native drivers, run `flutter test --coverage`, check projectFolder/coverage/Lcov.info 

1. Download objectbox native drivers  

As said in the objectbox documentation: \
To run unit tests on your machine, download a native ObjectBox library for your machine by running this script in a bash shell \(e.g. Git Bash on Windows): \
`bash <(curl -s https://raw.githubusercontent.com/objectbox/objectbox-dart/main/install.sh)`
 
The downloaded files must be placed in the project lib\ folder  

MacOS: if dart later complains that it cannot find the libobjectbox.dylib you probably have to unsign the dart binary (source: dart issue):  

`sudo codesign --remove-signature $(which dart)`

2. Run coverage test

Run command `flutter test --coverage`

4. Check if objectbox.g.dart is in coverage generated files

In coverage\lcov.info \
lib\objectbox.g.dart should not appear