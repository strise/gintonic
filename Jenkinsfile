defaultPodTemplate {
  podTemplate(
      containers: [
      containerTemplate(
        name: 'node',
        image: 'eu.gcr.io/ntnu-smartmedia/bucklescript:10-2',
        ttyEnabled: true,
        command: 'cat',
        resourceRequestCpu: '500m'
        )
      ]
    ) {
      lastTemplate('gqlt') {
        def scmVars

        stage("Checkout source") {
          scmVars = checkout scm
        }
        stage("Setup") {
          container("node") {
            sh 'echo ". /root/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true" >> ~/.profile'
          }
        }
        stage("Install") {
          container("node") {
            sh '. ~/.profile \
            &&  npm i -g npm \
            &&  npm ci \
            &&  npm run bootstrap'
          }
        }
        stage("Build") {
          container("node") {
            sh '. ~/.profile \
            &&  npm run build'
          }
        }
        stage("Test") {
          npm 'test'
        }
      }
    }
  }
