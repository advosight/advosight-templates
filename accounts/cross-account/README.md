# Cross account role setup
The cloudformation and scripts in this folder are designed to setup roles users can switch to in your account.  This approach leverages AWS's cross account role capabilities and AWS's STS service in order to assume these roles.  When a role is assumed in the command line, the user will be required to provide a MFA token in order to assume the role.  When the role is assumed, the user will be given temporary credentials which will be set in the terminal sessions' environment.  These credentials will be valid for 1 hour, then the script will need to be run again.

More around this approach can be read at: http://advosight.com/blog

# Technology used
This approach leverages AWS Cross Account Roles, STS and client side scripts in order to ensure MFA authentication for development tools such as AWS SAM, the Serverless Framework and the AWS CLI.

# The scripts

## Setup
For the type of script you want to use, open the script and replace the &lt;REPLACE ME&gt; with the information requested

## Running switchTo.sh
``` !bash
. ./switchTo.sh <MFA Token>
```

## Running switchTo.ps1
``` !ps1
switchTo.ps1
```
The script will prompt for an MFA Token

# Notes
This script can be modified to support multiple accounts, allowing secure and convenient command line access for developers and tools

# Disclaimer
The templates in this repository are an example and Advosight takes no responsibility for your use of them or any problems that come from using them.