
pipeline{
    agent any
    tools {
        terraform 'terraform-1.2.8'
    }
    stages{
        stage('Checkout from Git'){
            steps{
git branch: 'main', credentialsId: '992c7287-c416-4836-9603-52dd1a6cd983', url: 'https://github.com/pankajindevops/create-key-pair-in-terraform'            }
        }
        stage ('Terraform Init'){
            steps{
                sh label: '', script: 'terraform init -upgrade'
            }
        }
        stage ('Terraform Plan'){
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: '16-sep-2022-aws-credentials', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) 
                {
                   sh label: '', script: 'terraform plan -out tf.out'
                }
            }
        }
        stage ('Terraform Apply'){
            steps{
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: '16-sep-2022-aws-credentials', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) 
                {
                    sh label: '', script: 'terraform apply tf.out'
                }
            }
        }
    }
}