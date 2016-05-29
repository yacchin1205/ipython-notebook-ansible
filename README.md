Dockerfile for cloud operation environtment (IPython Notebook + Ansible + etc. tools)

#Example of Usage

```
$ sudo docker build -t nii_dev/ipython-notebook .
$ sudo docker run -d -p 10080:8888 -v /var/lib/ipython-notebook:/notebooks nii_dev/ipython-notebook
```
