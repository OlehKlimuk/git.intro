pipeline {
    agent  any
    stages {
        stage("delete all if exists") {
            steps {
                echo " ============== start deleting =================="
                dir ('.') {
                    sh '''
                    docker stop $(docker ps -a -q)
                    docker rm $(docker ps -a -q)
                    docker rmi $(docker images -q)
                    '''
                }
            }
        }

        stage("clone repo from github") {
            steps {
                echo " ============== start cloning =================="
                dir ('.') {
                    sh 'git clone https://github.com/OlehKlimuk/git.intro.git'
                }
            }
        }

        stage("create docker image") {
            steps {
                echo " ============== start building image =================="
                dir ('.') {
                    sh 'cd DevOps_final_project && docker build -t my_app . '
                }
            }
        }
        stage("docker run") {
            steps {
                echo " ============== start run image =================="
                sh 'docker run -p 80:8000 my_app'
            }
        }
    }
}