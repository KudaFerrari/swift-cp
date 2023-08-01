const path = require('path');
const fs = require('fs');

function buildPackage(){
  const directoryPath = path.join(__dirname, 'Sources');
  try {
    const files = fs.readdirSync(directoryPath);
    const packagePath = path.join(__dirname, 'Package.swift');
    let targets = ''
    for(let i = 0; i < files.length; i++){
      if (i > 0) targets += '\n';
      targets += `        .executableTarget(name: "${files[i]}"),`
    }
    const content = `
// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "example-package",
    targets: [
${targets}
    ]
)
`
      fs.writeFileSync(packagePath, content);
    } catch (error) {
      console.error('error:', err);
    }
}

function main() {
  buildPackage();
}

main();
