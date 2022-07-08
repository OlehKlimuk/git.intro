pipeline {
    agent { label 'main' }

    stages {
        stage('Delete workspace before build starts') {
            steps {
                echo 'Deleting workspace'
                deleteDir()
            }
        }
        stage('Checkout') {
            steps{
                git branch: 'main',
                    url: 'https://github.com/OlehKlimuk/git.intro.git'        
                }
        }
        stage('Test') {
            steps{
                dir('111') {
                    sh "ls -la "
                    sh "pwd"
                }
                    sh "ls -la "
                    sh "pwd"
            }
        }
        stage('Build docker image') {
            steps{
                dir('') {
                    sh 'docker build -t bakavets/jenkins-images:0.4 .'
                }
            }
        }
    }
}
