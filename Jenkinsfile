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
                echo " ============== start run image =================="
                sh 'docker run -p 80:8000 olehepam/proj'
            }
        }
    }
}
