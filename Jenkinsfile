pipeline {

    agent any

    environment {
        tfDir = "terraform"
        region = "us-east-1"
        AWSCreds = credentials('awsCreds')
        AWS_ACCESS_KEY_ID = "${AWSCreds_USR}"
        AWS_SECRET_ACCESS_KEY = "${AWSCreds_PSW}"
        AWS_DEFAULT_REGION = "us-east-1"
        pkrDir = "packer"
    }

    stages {
        stage('Create Amazon Machine Image') {
            steps {
                sh "packer --version"
                dir("${pkrDir}") {
                    sh "packer init"
                    sh "packer validate ."
                    sh "packer build ."
                }
            }
        }
    }
}