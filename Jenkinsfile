pipeline {

    agent any

    environment {
        pkrDir = "packer"
        region = "us-east-1"
    }

    stages {
        stage('Delete existing AMIs') {
            steps {
                withAWS(credentials: 'AWSCred', region: "${region}") {
                    sh "chmod +x deleteAmi.sh"
                    sh "sh deleteAmi.sh"
                }
            }
        }
        stage('Create Amazon Machine Image') {
            steps {
                withAWS(credentials: 'AWSCred', region: "${region}") {
                    sh "packer --version"
                    dir("${pkrDir}") {
                        sh "packer validate ."
                        sh "packer build ."
                    }
                }
            }
        }
    }
}