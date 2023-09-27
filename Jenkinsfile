pipeline {

    agent any

    environment {
        pkrDir = "packer"
        region = "us-east-1"
    }

    stages {

        stage('Create AMI with Packer') {
            when { expression {params.Ansible == "CreateAMI" } }
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