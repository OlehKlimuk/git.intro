pipeline {
    agent { label 'main' }

    
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
                dir('lesson-1') {
                    sh "ls -la "
                    sh "pwd"
                }
                    sh "ls -la "
                    sh "pwd"
            }
        }
        stage('Build docker image') {
            steps{
                dir('lesson-1') {
                    sh 'docker build -t bakavets/jenkins-images:0.4 .'
                }
            }
        }
}
