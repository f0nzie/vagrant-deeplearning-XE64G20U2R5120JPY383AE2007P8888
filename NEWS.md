# 20210115
* Testing if `!conda list` runs from Jupyter notebook. It does!


# 20210114

* Try installing `tensorflow`. Sucess! But it ate up almost all the hard disk space (10 GB)
    ![image-20210114215303332](assets/NEWS/image-20210114215303332.png)
    
* Installing `mxnet`. Failed!
    Disk status after 
    ``/dev/sda1       9.7G  6.5G  3.3G  67% /``
    
    <img src="assets/NEWS/image-20210114201154211.png" alt="image-20210114201154211"  />

* Deactivate plugin `vagrant-disksize`. Back to 10 GB disk.
* Try increasing disk size from 10 GB to 20 GB. Crashed the VM. New size is recognized. Using plugin `vagrant-disksize`.
* Installing mxnet on folder data. Success!
    ![image-20210114194819010](assets/NEWS/image-20210114194819010.png)
* Tested installing a different `pyenv` with Anaconda.
* Tested installation of `theano`. Success!
