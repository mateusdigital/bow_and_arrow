##~---------------------------------------------------------------------------##
##                               *       +                                    ##
##                         '                  |                               ##
##                     ()    .-.,="``"=.    - o -                             ##
##                           '=/_       \     |                               ##
##                        *   |  '=._    |                                    ##
##                             \     `=./`,        '                          ##
##                          .   '=.__.=' `='      *                           ##
##                 +                         +                                ##
##                      O      *        '       .                             ##
##                                                                            ##
##  File      : generate-release-zip.ps1                                      ##
##  Project   : Bow and Arrow                                                 ##
##  Date      : 2024-03-14                                                    ##
##  License   : See project's COPYING.TXT for full info.                      ##
##  Author    : mateus.digital <hello@mateus.digital>                         ##
##  Copyright : mateus.digital - 2024                                         ##
##                                                                            ##
##  Description :                                                             ##
##    Generates the release zip file.                                         ##
##---------------------------------------------------------------------------~##

$PLATFORM_NAME     = "windows";
$PROJECT_NAME      = "bow-and-arrow";
$PROJECT_VERSION   ="$(git describe --abbrev=0 --tags)";
$FULL_PROJECT_NAME ="${PROJECT_NAME}_${PROJECT_VERSION}";

$OUTPUT_DIR    = "dist/${FULL_PROJECT_NAME}";
$ZIP_FULL_PATH = "dist/${FULL_PROJECT_NAME}_${PLATFORM_NAME}.zip";


Write-Output "$0 ==> Generating release zip ($PLATFORM_NAME)...";

## Create the directory.
if(Test-Path "$OUTPUT_DIR") {
    Remove-Item -Path "$OUTPUT_DIR" -Force -Recurse;
}
New-Item -ItemType Directory -Path "$OUTPUT_DIR";

## Copy resources.
Copy-Item -Path "build-pc-Release/*"           -Destination $OUTPUT_DIR -Verbose -Recurse;
Copy-Item -Path "resources/readme-release.txt" -Destination $OUTPUT_DIR -Verbose;

## Make the zip
Compress-Archive -Path "$OUTPUT_DIR" -DestinationPath "$ZIP_FULL_PATH" -Force;

Write-Output "$0 ==> Done...";
