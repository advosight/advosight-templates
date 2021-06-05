$mfaArn = "<REPLACE ME>" # For your user, find the AWS MFA ARN.  This is located in the AWS Console in your user's details
$account = "<REPLACE ME>" # The account number of the account you're logging into.  This is typically your aws account
$emailAddress = "<REPLACE ME>" # Your email address you are using to log in with
$role = "serverless-engineer"

# Get token code 
$token_code = Read-Host -Prompt 'Enter MFA token'

$roleJSON = (aws sts assume-role --role-arn "arn:aws:iam::$($account):role/$role" --role-session-name $emailAddress --serial-number $mfaArn --token-code $token_code) | ConvertFrom-Json

$ENV:AWS_ACCESS_KEY_ID = $roleJSON.Credentials.AccessKeyId
$ENV:AWS_SECRET_ACCESS_KEY = $roleJSON.Credentials.SecretAccessKey
$ENV:AWS_SESSION_TOKEN = $roleJSON.Credentials.SessionToken

aws sts get-caller-identity