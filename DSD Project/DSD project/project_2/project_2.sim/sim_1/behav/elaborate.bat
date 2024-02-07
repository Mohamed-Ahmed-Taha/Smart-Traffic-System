@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto 47ba42f911d94864aed2f2f09f9b8d56 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot Top_behav xil_defaultlib.Top -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
