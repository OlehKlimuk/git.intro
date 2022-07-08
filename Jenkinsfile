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
                dir('proj') {
                    sh "ls -la "
                    sh "pwd"
                }
                    sh "ls -la "
                    sh "pwd"
            }
        }
       stage('Build docker image') {
            steps{
                dir('proj') {
                    sh 'docker build -t bakavets/jenkins-images:0.4 .'
                }
            }
        }
        stage('Push docker image to DockerHub') {
            steps{
                withDockerRegistry(credentialsId: 'dockerhub-cred-bakavets', url: 'https://index.docker.io/v1/') {
                    sh '''
                        docker push bakavets/jenkins-images:0.4
                    '''
                }
            }
        }
        stage('Delete docker image locally') {
            steps{
                sh 'docker rmi bakavets/jenkins-images:0.4'
            }
        }
    }
}
