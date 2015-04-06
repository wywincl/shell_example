# Shell 学习笔记

Shell 是一个用C语言编写的程序，它是用户使用Linux的桥梁。Shell既是一种命令语言，又是一种程序设计语言。

Shell 是指一种应用程序，这个应用程序提供了一个界面，用户通过这个界面访问操作系统内核的服务。

---
## <a name='TOC'>目录</a>

  1. [脚本](#scripts)
  1. [环境](#environments)
  1. [变量](#variables)
  1. [命令](#commands)
  1. [流程控制](#statements)
  1. [函数](#functions)
  1. [参考](#references)

---
## <a name='scripts'>脚本</a>

Shell 脚本（shell script），是一种为shell编写的脚本程序。

## <a name='environments'>环境</a>
Shell 编程跟java、php编程一样，只要有一个能编写代码的文本编辑器和一个能解释执行的脚本解释器就可以了。  

Linux的Shell种类众多，常见的有：

* Bourne Shell（/usr/bin/sh或/bin/sh）  
* Bourne Again Shell（/bin/bash）
* C Shell（/usr/bin/csh）
* K Shell（/usr/bin/ksh）
* Shell for Root（/sbin/sh）
* ……  

 在这里我们关注的是Bash，也就是 Bourne Again Shell，由于易用和免费，Bash在日常工作中被广泛使用。同时，Bash也是大多数Linux系统默认的Shell。

在一般情况下，人们并不区分 Bourne Shell 和 Bourne Again Shell，所以，像 **#!/bin/sh**，它同样也可以改为__#!/bin/bash__。  

***
### 第一个shell脚本
打开文本编辑器(可以使用vi/vim命令来创建文件)，新建一个文件test.sh，扩展名为sh（sh代表shell），扩展名并不影响脚本执行，见名知意就好，如果你用php写shell 脚本，扩展名就用php好了。  

输入一些代码，第一行一般是这样：  

	#!/bin/bash  
	echo "Hello Shell" # --- John.wang

"#!" 是一个约定的标记，它告诉系统这个脚本需要什么解释器来执行，即使用哪一种Shell。  
echo命令用于向窗口输出文本。

#### 运行Shell脚本有两种方法：
**1. 作为可执行文件**    

将上面的代码保存为test.sh，并cd到相应目录:  

	chmod +x ./test.sh #使脚本具有可执行权限
	./test.sh #执行脚本

注意，一定要写成./test.sh，而不是test.sh，运行其它二进制的程序也一样，直接写test.sh，linux系统会去PATH里寻找有没有叫test.sh的，而只有/bin, /sbin, /usr/bin，/usr/sbin等在PATH里，你的当前目录通常不在PATH里，所以写成test.sh是会找不到命令的，要用./test.sh告诉系统说，就在当前目录找。  


**2. 作为解释器参数**  

这种运行方式是，直接运行解释器，其参数就是shell脚本的文件名，如：
  
	/bin/bash test.sh 
	/bin/sh   test.sh 

这种方式运行的脚本，不需要在第一行指定解释器信息，写了也没用。

---
## <a name='variables'>变量</a>
#### 定义变量
定义变量时，变量名不加美元符号（$），如：

    your_name = "openwrt"

注意，变量名和等号之间不能有空格.同时，变量名的命名须遵循如下规则：  

* 首个字符必须为字母（a-z，A-Z
* 中间不能有空格，可以使用下划线
* 不能使用标点符号
* 不能使用bash里的关键字(可用help命令查看保留关键字)

除了显式地直接赋值，还可以用语句给变量赋值，如：

    for file in `ls /etc`

以上语句将 /etc 下目录的文件名循环出来。

#### 使用变量
使用一个定义过的变量，只要在变量名前面加美元符号即可，如：

    your_name = "openwrt"
    echo $your_name
    echo ${your_name}

变量名外面的花括号是可选的，加不加都行，加花括号是为了帮助解释器识别变量的边界，比如下面这种情况：

    for skill in Ada Coffe Action Java do
        echo "I am good at ${skill}Script"
    done

如果不给skill变量加花括号，写成echo "I am good at $skillScript"，解释器就会把$skillScript当成一个变量（其值为空），代码执行结果就不是我们期望的样子了。

推荐给所有变量加上花括号，这是个好的编程习惯。

已定义的变量，可以被重新定义，如：

    your_name="tom"
    echo $your_name
    your_name="alibaba"
    echo $your_name

这样写是合法的，但注意，第二次赋值的时候不能写$your_name="alibaba"，使用变量的时候才加美元符（$）。

#### Shell 字符串

字符串是shell编程中最常用最有用的数据类型（除了数字和字符串，也没啥其它类型好用了），字符串可以用单引号，也可以用双引号，也可以不用引号。

##### 单引号

    str = 'this is a string'

单引号字符串的限制：  

* 单引号里的任何字符都会原样输出，单引号字符串中的变量是无效的；  
* 单引号字串中不能出现单引号（对单引号使用转义符后也不行）。


##### 双引号

    your_name='openwrt'
    str = "Hello, I know your are \"$your_name\"! \n"
    
双引号的优点：  

* 双引号里可以有变量。
* 双引号里可以出现转义字符。



---
## <a name='commands'>命令</a>




---
## <a name='statements'>流程控制</a>

---
## <a name='functions'>函数</a>

---
## <a name='references'>参考</a>