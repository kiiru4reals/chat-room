pipeline {
    agent {label "linux"}
    stages{
        stage('Hello') {
            steps {
                echo "Hello from Jenkinsfile"
            }
        }
        stage ('for branch with the name create-*') {
            when {
                branch "create-*"
            }
            steps {
                sh '''
                    cat README.md
                '''
            }
        }
        stage ('for the PR') {
            when {
                branch 'PR-*'
            }
            steps {
                echo 'this only runs for the PRs'
            }
        }
    }
}