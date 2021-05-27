自动测试脚本使用说明：
一、在脚本最后一段里，需要指定输入输出文件的路径
二、需要新建输入文件in.txt，其中test_time表示人为设置的最大仿真时间，内容语法如下
test_name:print_pass
test_command:echo "pass"
test_time:30

test_name:print_fail
test_command:echo "fail"
test_time:30
