System.config({
  "baseURL": "/",
  "transpiler": "babel",
  "babelOptions": {
    "optional": [
      "runtime"
    ]
  },
  "paths": {
    "*": "*.js",
    "github:*": "jspm_packages/github/*.js",
    "npm:*": "jspm_packages/npm/*.js"
  },
  "bundles": {
    "build": [
      "npm:process@0.10.1/browser",
      "github:components/jquery@2.1.4/jquery",
      "github:lhorie/mithril.js@next/mithril",
      "npm:process@0.10.1",
      "github:components/jquery@2.1.4",
      "github:lhorie/mithril.js@next",
      "github:jspm/nodelibs-process@0.1.1/index",
      "github:jspm/nodelibs-process@0.1.1",
      "npm:lodash@3.9.3/index",
      "npm:lodash@3.9.3",
      "main"
    ]
  }
});

System.config({
  "map": {
    "babel": "npm:babel-core@5.6.3",
    "babel-runtime": "npm:babel-runtime@5.6.3",
    "bootstrap": "github:twbs/bootstrap@3.3.5",
    "core-js": "npm:core-js@0.9.18",
    "jquery": "github:components/jquery@2.1.4",
    "lodash": "npm:lodash@3.9.3",
    "mithril.js": "github:lhorie/mithril.js@next",
    "github:jspm/nodelibs-process@0.1.1": {
      "process": "npm:process@0.10.1"
    },
    "github:twbs/bootstrap@3.3.5": {
      "jquery": "github:components/jquery@2.1.4"
    },
    "npm:babel-runtime@5.6.3": {
      "process": "github:jspm/nodelibs-process@0.1.1"
    },
    "npm:core-js@0.9.18": {
      "fs": "github:jspm/nodelibs-fs@0.1.2",
      "process": "github:jspm/nodelibs-process@0.1.1",
      "systemjs-json": "github:systemjs/plugin-json@0.1.0"
    },
    "npm:lodash@3.9.3": {
      "process": "github:jspm/nodelibs-process@0.1.1"
    }
  }
});

