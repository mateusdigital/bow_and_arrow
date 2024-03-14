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
##  File      : build-game.cs                                                 ##
##  Project   : Bow and Arrow                                                 ##
##  Date      : 2024-03-14                                                    ##
##  License   : See project's COPYING.TXT for full info.                      ##
##  Author    : mateus.digital <hello@mateus.digital>                         ##
##  Copyright : mateus.digital - 2024                                         ##
##                                                                            ##
##  Description :                                                             ##
##---------------------------------------------------------------------------~##

##------------------------------------------------------------------------------
dotnet publish "./project/Bow_and_Arrow" `
    -c Release -r win-x64     `
    --self-contained true     `
    -p:PublishSingleFile=true `
    -p:IncludeSymbols=false   `
    -p:DebugType=None         `
    -o "./build-pc-Release"
