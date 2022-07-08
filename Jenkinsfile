pipline {
    agent { lable 'main' }
stage('Delete workspace before build starts') {
            steps {
                echo 'Deleting workspace'
                deleteDir()
            }
        }
        stage('Checkout') {
            steps{
                git branch: 'main',
                    url: 'https://github.com/bakavets/docker-lessons.git'        
                }
        }
}    
