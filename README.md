# Vagrant LAMP #

This Vagrant virtual machine allows you to create a simple Ubuntu Trusty64 server for LAMP stack developers which also includes many related modern development tools.

Please read all the document before start using the project.

### Overview ###

A lot of PHP websites and applications don’t require much server configuration or overhead at first. This Vagrant virtual machine should have all your needs for doing basic development so you don’t have to worry about configuring Vagrant and you can simply focus on your code.

### Setup ###

The project has the following pre requisites:

* Git [http://git-scm.com/](http://git-scm.com/)
* Vagrant [http://www.vagrantup.com/](http://www.vagrantup.com/)
* VirtualBox [http://www.virtualbox.org/](http://www.virtualbox.org/)

Once you have installed the prerequisites, fork and clone the project repository, copy the [vagrant folder](./vagrant) into your project root folder, and modify the following lines in [vagrant/init.sh](./vagrant/init.sh):

```
GIT_EMAIL="user@domain.com"
GIT_USER="User Name"
MYSQL_PASSWORD="pass"
```

Now execute the following command:

```
$ vagrant up
```

Thats all, is pretty simple.

If you need more information related to Vagrant, go to the official [Vagrant documentation](https://www.vagrantup.com/docs/).

### MIT License ###
##### Copyright (c) 2016 Esteban Spina #####

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
