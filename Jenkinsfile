pipeline {
    agent { label 'main' }

    stages {
        stage('Delete workspace before build starts') {
            steps {
                echo 'Deleting workspace'
                deleteDir()
            }
        }
        stage('stop and rm'){
            steps {
                sh 'docker stop $(docker ps -a -q)'
                sh 'docker rm $(docker ps -a -q)'
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
                dir('112') {
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
                    sh 'docker build -t olehepam/proj .'
                }
            }
        }
         stage('Push docker image to DockerHub') {
            steps{
                withDockerRegistry(credentialsId: 'dockerhu-cred-oleh', url: 'https://index.docker.io/v1/') {
                    sh '''
                        docker push olehepam/proj
                    '''
                }
            }
         }
         stage("docker run") {
            steps {
                sh 'docker run -d -p 80:80 olehepam/proj'
            }
        }
    }
}
