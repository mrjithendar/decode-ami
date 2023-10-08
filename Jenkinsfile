pipeline {

    agent any

    parameters {
        choice(name: 'AMI', choices: ['AWSCred', 'AWSJithendar'], description: 'Pick AWS Account to Create AMI')
        }

    environment {
        pkrDir = "packer"
        region = "us-east-1"
        creds = "${params.AMI}"
    }

    stages {
        stage('Create Amazon Machine Image') {
            steps {
                withAWS(credentials: "${creds}", region: "${region}") {
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