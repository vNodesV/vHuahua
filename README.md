
# vHuahua: Disaster Recovery Script.
## Purpose is to take a fresh Ubuntu installation and deploy everything necessary to have chihuahuad 4.1.0 deployed and ready for configuration..



### To be installed:
- WGET
- GIT
- GCC
- Make
- jq
- GO 19.2
- Chihuahuad v4.1.0





### Process: 
   - Update and Upgrade OS. 
- Check for WGET, GIT, GCC, Make and jq.
    - Install missing, if any. 
- Check for previous version of GO.<
    - remove older version from $HOME and/or /usr/local/bin/<
- Download and Install GO in $HOME<
    - the version can be modified at the top of /src/main.sh<
- Symbolic link $HOME/go/bin/go /usr/local/bin/go
- Deploying chihuahuad v4.1.0
- Symbolic Link from $HOME/go/bin/chihuahuad to /usr/local/bin
- Final test of chihuahuad version
  
### At this point, everything is in place and Chihuahuad is ready for setup. 
 

Note: Self-thought. This is my first full script and I welcome any constructive feedback. @dSebster or dsebster@vnodes.cloud




## INSTRUCTIONS:
- Download GIT from your home folder and run the install.sh script:
   ```
   git clone https://github.com/vNodesV/vHuahua.git && bash vHuahua/install.sh
   ``` 
- Enter password for sudo
- You will need to check and approve services restart along the way. 
   - hit OK and restart whatever services are already checked off.
  
  that's it. Now you can configure your node. 
  
  https://github.com/ChihuahuaChain/chihuahua
  
  
    
