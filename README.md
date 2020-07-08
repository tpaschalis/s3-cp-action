# GitHub Action to `aws s3 cp` a file to an S3 Bucket 🔄

This simple action uses the [vanilla AWS CLI](https://docs.aws.amazon.com/cli/index.html) to sync a directory (either from your repository or generated during your workflow) with a remote S3 bucket.



## Usage

### `workflow.yml` Example

Place in a `.yml` file such as this one in your `.github/workflows` folder. [Refer to the documentation on workflow YAML syntax here.](https://help.github.com/en/articles/workflow-syntax-for-github-actions)

```
name: Sync Bucket
on: push

jobs:
  deploy:
    runs-on: ubuntu-latest

    steps:
   - uses: actions/checkout@master

   - name: Upload binary to S3 bucket
   uses: tpaschalis/s3-sync-action@master
   with:
     args: --acl public-read
   env:
     FILE: ./gh-actions-golang
     AWS_REGION: 'eu-central-1'
     AWS_S3_BUCKET: ${{ secrets.AWS_S3_BUCKET }}
     AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
     AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
```


### Required Environment Variables

| Key | Value | Type | Required |
| ------------- | ------------- | ------------- | ------------- |
| `FILE` | The local file you wish to upload to S3. For example, `./myfile.txt`. | `env` | **Yes** |
| `AWS_REGION` | The region where you created your bucket in. For example, `eu-central-1`. [Full list of regions here.](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html#concepts-available-regions) | `env` | **Yes** |

### Optional Environment Variables

| Key | Value | Type | Required |
| ------------- | ------------- | ------------- | ------------- |
| `DEST` | Optional subdirectory to upload a file to. | `env` | **No** |

### Required Secret Variables

The following variables should be added as "secrets" in the action's configuration.

| Key | Value | Type | Required |
| ------------- | ------------- | ------------- | ------------- |
| `AWS_S3_BUCKET` | The name of the bucket you're syncing to. For example, `golang-deployment-bucket`. | `secret` | **Yes** |
| `AWS_ACCESS_KEY_ID` | Your AWS Access Key. [More info here.](https://docs.aws.amazon.com/general/latest/gr/managing-aws-access-keys.html) | `secret` | **Yes** |
| `AWS_SECRET_ACCESS_KEY` | Your AWS Secret Access Key. [More info here.](https://docs.aws.amazon.com/general/latest/gr/managing-aws-access-keys.html) | `secret` | **Yes** |


## License

This project is distributed under the [MIT license](LICENSE.md).
