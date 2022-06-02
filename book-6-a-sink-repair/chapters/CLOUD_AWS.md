# Deploying Your Projects with Amazon Web Services

## Amazon Web Services (AWS)

[AWS](https://aws.amazon.com), a subsidiary of Amazon, is the leading provider of
on-demand cloud computing platforms and APIs. According to
[Canalys](https://www.canalys.com/newsroom/global-cloud-market-q4-2020), AWS owns
around one third of the cloud computing market and has reported revenue of $12.7 billion
for Q4 2020. Its competitors include [Microsoft Azure](https://azure.microsoft.com/en-us/free/)
and [Google Cloud Platform](https://cloud.google.com).

## Why Deploy on AWS?

Your ability to display your projects running on AWS servers will signal to employers your ability to work in a modern software development team, many of which are now responsible for the deployment, monitoring, and maintenance of their software stack in the cloud.

## Getting Started

### AWS Account
Working with AWS requires an active AWS account. Fortunately, as of March 2021 Amazon still offers
an extended free-tier account that gives free access for one year to all the services you will need to deploy your application. Even still, note that setting up an AWS account requires an active credit or debit card, which will be billed if your usage exceeds the free tier limit.

These instructions will teach you how to set up daily billing alerts as an additional tool to prevent excessive unwanted charges. Moreover, AWS automatically tracks your service usage and will alert you if you have reached 85% of the usage limit for one or more AWS Free Tier-eligible services.

Nonetheless, **prioritize security** to protect your assets.

#### Creating and Activating Your Account
1. Open the [Amazon Web Services home page](https://aws.amazon.com/).
2. Choose **Create an AWS Account**.
3. Enter your account information. [Choose a strong password](https://www.lastpass.com/password-generator),
   document the information securely, and then choose **Continue**.

> 🧨 You will notice that this document repeatedly mentions securing your credentials. The
importance of this cannot be overstated. Your finances are now tied to your AWS credentials. In the
wrong hands, an AWS account can accrue charges rapidly, even with a daily budget and AWS usage
tracking.
>
> Consider using a password manager such as [LastPass](https://www.lastpass.com/) or
[1Password](https://1password.com/landing/password-manager/), services whose yearly costs
mirror the cost of one hour of the [most expensive EC2 instances](https://instances.vantage.sh/).
Pay for basic credential management to avoid paying for someone else's unauthorized use of your
account.**

4. Choose **Personal**.
5. Enter your personal information.
6. Enter your billing information.
7. Confirm your identity with a phone number.
8. Enter the verification code.
9. Select the **Basic Plan**.

You will receive an email to confirm that your account has been created. Once that
happens, you can access your account with the email address and password you used to
register.

#### Setting Up an IAM User and Root Multi-factor Authentication
1. Open the [Amazon Web Services home page](https://aws.amazon.com/).
2. Choose **Sign In to the Console**.
3. Sign in as the **Root user**.
4. [Set up a virtual Multi-factor Authentication device for your AWS account root user.
   ](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_mfa_enable_virtual.html#enable-virt-mfa-for-root)
   **Setting up multi-factor authentication is another vital step toward securing your account.**
5. Navigate to **IAM** with the search bar at the top of the screen.
6. Choose **Users** on the left navigation menu.
7. Select **Add user**.
8. Enter a **User name** and check both **Programmatic** and **AWS Management
   Console** access.
9. Choose a **Console password** type and determine whether you would like to
   **Require password reset** for the user at initial sign-in.
10. Choose **Next: Permissions**.
11. Choose **Create group**.
12. Enter `Admin` in the **Group name** box and select **Administrator Access** in the
    policy name menu.
13. Choose **Create group**.
14. Choose **Next: Tags**.
15. Choose **Next: Review**.
16. If all looks as you expect, choose **Create User**.

#### Setting Up a Budget
1. While logged in to the AWS console as the root user, choose **My Account** from the account
   dropdown menu in the top right corner of the screen.
2. Scroll down to **IAM User and Role Access to Billing Information** and select **edit**.
3. Select **Activate IAM Access** and **Update**.
4. Document all credentials securely: root user email address; root user password; IAM
   username; IAM password, and account number.
5. **Sign out** of the Root account through the account dropdown menu in the top right
   corner of the screen. It is widely considered bad practice to perform tasks with the root
   user. The root user should only be used to create the first IAM administrative user, to open
   billing privileges to administrators, and to close the account. **Store the credentials securely.**
6. Open the [Amazon Web Services home page](https://aws.amazon.com/).
7. Choose **Sign In to the Console**.
8. Sign in as the **IAM user** you created above.
9. Use the search console to find **AWS Budgets**.
10. Choose **Create budget**.
11. Select **Cost budget**.
12. Name the budget. Choose **Daily** for the **Period**. Select **Recurring budget** and
    **Fixed**. Enter $0.01 as the **Budgeted Amount**.
13. Choose **Configure thresholds**.
14. Set threshold based on **Actual cost**.
15. Set the **Alert threshold** to 100%. Note that you may want a different threshold if your budget is greater than $0.01.
16. Set up notifications by entering an email address in the **Email recipients** box.
17. Choose **Confirm budget**.

#### IAM Multi-factor Authentication
1. [Set up multi-factor authentication for your IAM user.](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_mfa_enable_virtual.html)
2. **Sign out** of your AWS account through the account dropdown menu in the top
    right corner of the screen.

**Congratulations! You are now ready to deploy your application with AWS.**

## AWS Elastic Beanstalk and the AWS Elastic Beanstalk CLI

### AWS Elastic Beanstalk
AWS developed Elastic Beanstalk to facilitate the deployment of web applications with
AWS managed services. It orchestrates the provisioning and monitoring of the
infrastructure necessary to manage a scalable and secure web application developed
with Java, .NET, PHP, Node.js, Python, Ruby, or Go.

### Installing the Elastic Beanstalk CLI
While it is possible to deploy an application through the AWS Elastic Beanstalk Console, you will find
working with the CLI to be more efficient. You can find installation instructions
[here](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb-cli3-install-advanced.html). Note
that the CLI requires Python 2.7, 3.4 or later. Since Python 2 has reached its
[end of life](https://www.python.org/doc/sunset-python-2/), you should be working in Python 3.

Review the Elastic Beanstalk Command Line reference material [here](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb3-cmd-commands.html).

## Deploying Your React Application with AWS Elastic Beanstalk

### AWS Elastic Beanstalk Static Site Tutorial
Before working to deploy your application, it is worth completing a [tutorial](https://dev.to/johanrin/i-deployed-a-server-side-react-app-with-aws-elastic-beanstalk-here-s-what-i-learned-217i) to orient yourself
to the Elastic Beanstalk tools and to make sure you have configured them correctly on your machine. It
should take no more than an hour, which is less time than it will take you to learn the service while
fighting to deploy your application with misconfigurations.

### A Note About Using json-server

Many NSS projects use `json-server` to mock backend responses. Deploying an application to the web with such a setup presents a **significant security risk**. In short, it allows unknown users to access and/or manipulate your data.

The intent of these instructions for deploying your frontend application is to acclimate you to working with AWS. It is **not** to teach you how to deploy a frontend application with proper security protocols.

> 🧨 It is essential that you follow the security
group instructions below to limit ingress to your application to your computer's IP on your home network. Failing to do so represents significant risk to your users and your AWS account, which - as noted above - is tied to your finances.**

### Setting Up a Static Application with JSON Server

Deploying a static application with a JSON server on Elastic Beanstalk will require you to make a few small changes to your code. Fortunately, [Andy Collins](https://github.com/askingalot) has written a simple JSON server that you can incorporate your project to get it up and running in the cloud.

1. In your application's main directory, create a file named `package.json` and place the following content in it. Change the `name` property to something suitable.
    ```json
    {
        "name": "replace-me-with-project-name",
        "version": "1.0.0",
        "description": "Simple json-server database to deploy to the cloud",
        "main": "server.js",
        "scripts": {
            "start": "node server.js"
        },
        "keywords": [
            "json-server, node, REST API"
        ],
        "author": "NSS Student",
        "license": "ISC",
        "dependencies": {
            "json-server": "^0.14.2"
        }
    }
    ```
1. Create a `server.js` file in your application's main directory. Configure it as follows:

    ```js
    const path = require('path');
    const dbPath = './api/database.json';
    const jsonServer = require('json-server');
    const server = jsonServer.create();
    const router = jsonServer.router(dbPath);
    const middlewares = jsonServer.defaults({ static: "./src" });
    const port = process.env.PORT || 5002;

    server.use(middlewares);

    server.use((req, res, next) => {
        const isApiRoute = req.originalUrl.includes('/api/');
        if (isApiRoute) {
            return next();
        }
        return res.sendFile(path.join(__dirname, './src/index.html'));
    });

    server.use(jsonServer.rewriter({
        '/api/*': '/$1'
    }));

    server.use(router);

    server.listen(port, () => {
        console.log(`Application running on port ${port}`);
    });
    ```


**Congratulations! You application is now configured for development and deployment.**

### Initializing Elastic Beanstalk
From your application's home directory, run ```eb init```. This sets default values for Elastic Beanstalk
applications. It will ask a series of questions:

1. If you have not set up your Elastic Beanstalk CLI with your AWS credentials, the prompts will ask you
for your AWS IAM user's key and secret key. You will be able to find these credentials in the AWS console
under IAM --> Users --> <your_user> --> Security credentials. If you are unable to access your credentials
or failed to store them when you accessed them initially, you can create new credentials. **Document
them securely.**
2. Select **us-east-1** as your region. The reason for this is two-fold. First, it is best practice
to deploy your application closest to its user base. Amazon's us-east-1 region is based in
northern Virginia. The proximity argument may lead to your wanting to select us-east-2, which is
in Ohio. Nonetheless, you should still choose us-east-1 because this is the region in which
AWS often deploys its newest services first. The benefit of having access to the newest services
far outweighs the cost of a few hundred miles.
3. Choose **[ Create new Application ]**. It will default to the the name of your application's main folder.
4. Allow the default value for `Application Name`.
5. The prompt will ask you whether you are using Node.js. Enter **Y**.
6. Choose the version of Node you used locally to develop your project.
7. Select **n** for [CodeCommit](https://aws.amazon.com/codecommit/). You do not need an AWS-managed service for
source control.
8. Set up SSH access for your EC2 instances if you would like:
   * Select a keypair.
   * Name the keypair.
   * Enter a passphrase.
   * The public key will be saved locally to `/Users/<user>/.ssh/<keypair_name>`.
   * Enter your passphrase to upload the public key to AWS. **Store this passphrase securely**. You will need it each time
     you use the keypair.

### Creating Your Elastic Beanstalk Application
From your application's home directory, run ```eb create```. This will generate a new Elastic Beanstalk environment and deploy your application to it.

1. Choose an environment name or allow the default value.
2. Enter a value for the prefix of your application's [DNS Canonical Name record](https://en.wikipedia.org/wiki/CNAME_record) or allow the default value.
3. Select an **application** load balancer. AWS is in the process of deprecating Classic load balancers. Network load balancers cost money, and
you do not need their low level configuration options to deploy your capstone.
5. Choose **n** for [Spot Fleet requests](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-fleet-requests.html).
Since you are deploying a light application on the free tier, you do not need to worry about this configuration option.

From this point, the service will complete the following steps:
1. Package and deploy your application to [S3](https://aws.amazon.com/s3/).
2. Upload your [ssh keypair](https://www.ssh.com/ssh/public-key-authentication) to [EC2](https://aws.amazon.com/ec2/) if you attached one to the environment in the steps above.
3. Create a [target group](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-target-groups.html).
4. Create [security groups](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html).
5. Create an [auto-scaling](https://aws.amazon.com/autoscaling/) launch configuration and auto scaling group.
6. Create an EC2 instance.
7. Create auto scaling group policies for scaling your application's resources up and down.
8. Create two [CloudWatch](https://aws.amazon.com/cloudwatch/) alarms to support auto scaling.
9. Create an [application load balancer and load balancer listener](https://aws.amazon.com/elasticloadbalancing/).
10. Deploy your application to your EC2 instance.
11. Print the DNS CNAME of your Elastic Beanstalk environment, which will follow the pattern
<DNS_CNAME_prefix>.us-east-1.elasticbeanstalk.com.

### Update Your Application Code

You will need to replace all calls to `localhost:<port>` with `<elastic_beanstalk_environment_DNS_CNAME>/api`. If you followed the instructions, you should have the following line of code in your provider.

```js
const API = "http://localhost:8088"
```

You need to change it to look like this. Do not copy pasta this exactly since your domain name is different. Make sure `/api` is at the end.

```js
const API = "http://eb_react_app.us-east-1.elasticbeanstalk.com/api"
```

Deploy your changes as follows:

```sh
git add .
git commit -m "<your detailed commit message>"
eb deploy --staged
```

Elastic Beanstalk only updates from the `HEAD` commit of the `main` Git branch. Deploying with the `--staged`
flag pulls all the changes you have staged for pushing to your `main` branch. This way you can confirm that your application
works before committing the changes to the `main` branch.

### Update Your Application Load Balancer's Security Group
**IMPORTANT**: Without this step, your application's data will be exposed to the world. Take this step seriously, and
complete it from your own computer on your home router.

1. Log in to the [AWS Management Console](https://console.aws.amazon.com/).
2. Go to the EC2 service. You can search for it in the search bar at the top or use the dropdown `Services` menu to
locate it.
3. In the left navigation bar, select `Security Groups`.
4. Find the Security Group with the **Name** of your Elastic Beanstalk Application and the following **Description**:
    ```
    Elastic Beanstalk created security group used when no ELB security groups are specified during ELB creation
    ```
5. Click on its **Security group ID**.
6. Select **Edit inbound rules**.
7. Under **Source** close the box with the entry `0.0.0.0/0`.
8. In the dropdown menu that has **Custom**, select `My IP`.
9. Select **Save rules**.
10. Your application is now restricted to your home network. It will accept traffic from no other source.

**Congratulations! You have now deployed your application with AWS Elastic Beanstalk.**

### Reviewing the Health, Status, and Configuration of Your Elastic Beanstalk Environment
To check the health of your Elastic Beanstalk environment, you can run `eb status` from the command line.

To review other facts about your Elastic Beanstalk application and environment, access the Elastic Beanstalk console via
the **Search Bar** or **Services** menu in the AWS Console. The logs functionality is especially helpful for debugging. To
access your application's logs, go to the Elastic Beanstalk console. Select **Environments** on the left navigation menu.
Select your environment. In the navigation pane, choose **Request Logs**. When Elastic Beanstalk finishes processing the
logs, choose **Download**.

You can terminate your Elastic Beanstalk environment with `eb terminate`. This will tear down all the AWS resources you have deployed.
