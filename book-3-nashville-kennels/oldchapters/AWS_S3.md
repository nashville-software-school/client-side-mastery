# AWS S3

## AWS Free Tier account

You will be learning how to use several services provided on the [Amazon Web Services](https://portal.aws.amazon.com/gp/aws/developer/registration/index.html) platform. The free tier provides you with one year of all the resources you will need to deploy your finished products to a custom domain name for future employers to see.

## S3

Simple Storage Service (S3) on AWS is a quick and easy way to deploy a simple, static website.

1. Sign in to AWS
1. Click _Services_ > choose _S3_
1. Click _Create bucket_
1. Enter in the name of your application that you want to deploy. For example, `bobcat-intelligence-report` or `penguins-nutshell`. Using your team name will be helpful since all S3 bucket names need to be unique, globally, across all accounts.
1. Click _Next_
1. Click _Next_ again
1. Set the _Manage public permissions_ to _Grant public read access on this bucket_
1. Click _Create bucket_

Now your new bucket will appear in the S3 list. Before you add your site files, you need to configure the bucket to be a static website hosting location.

1. Click your bucket
1. Click the _Properties_ tab
1. Enable _Static website hosting_
1. Choose the _Use this bucket to host a website_ option
1. Type `index.html` as your index document.
1. Click _Save_

Now it is configured. You can click on the _Static website hosting_ panel again and click the URL at the top. It will open that URL in a new window. Once you upload your files, you will not see the __*404 Not Found*__ error any longer.

Now go back to your bucket and click the _Upload_ button.

In the panel that appears, you can simply drag & drop your files from Windows Explorer or the Mac Finder app onto that panel.

Once the files are uploaded, refresh the URL you clicked on previously and you should see your application.