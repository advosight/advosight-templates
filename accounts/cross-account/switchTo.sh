mfaArn='<REPLACE ME>' # For your user, find the AWS MFA ARN.  This is located in the AWS Console in your user's details
account='<REPLACE ME>' # The account number of the account you're logging into.  This is typically your aws account
emailAddress='<REPLACE ME>' # Your email address you are using to log in with
role='serverless-engineer'

roleJSON=$(aws sts assume-role --role-arn arn:aws:iam::$account:role/$role --role-session-name $emailAddress --serial-number $mfaArn --token-code $1)

AWS_ACCESS_KEY_ID=$(echo $roleJSON | jq -r '.Credentials.AccessKeyId')
AWS_SECRET_ACCESS_KEY=$(echo $roleJSON | jq -r '.Credentials.SecretAccessKey')
AWS_SESSION_TOKEN=$(echo $roleJSON | jq -r '.Credentials.SessionToken')

export AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY
export AWS_SESSION_TOKEN

aws sts get-caller-identity