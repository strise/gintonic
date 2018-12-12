def image = "eu.gcr.io/ntnu-smartmedia/gintonic"

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
      lastTemplate('gintonic') {
        def scmVars

        stage("Checkout source") {
          scmVars = checkout scm
        }
        
        
        if (env.TAG_NAME) {
          stage("Build") {
            def version = tagToVersion env.TAG_NAME
            if (version) {
              dockerBuildAndPush image: image, tag: version, buildArgs: [VERSION: version]
            } else {
              print "Not a version tag, skipping..."
            }
          }
        } else {
          stage("Setup") {
            container("node") {
              sh 'echo ". /root/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true" >> ~/.profile'
            }
          }
          stage("Install") {
            container("node") {
              sh '. ~/.profile \
              &&  npm i -g npm lerna@3.6.0 \
              &&  npm run bootstrap \
              &&  npm run build'
            }
          }
          stage("Test") {
            npm 'test'
          }
        }
      }
    }
  }
