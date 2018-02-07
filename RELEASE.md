1. Bump version and build numbers
`fastlane run bump_version_number bump_type:[major|minor|patch]`
`fastlane run bump_build_number`
2. Commit both those changes on develop with the message `Bump version $VERSION`
`git commit -am "Bump version $VERSION`
3. Tag the new commit with the version number of the release. 
`git tag $VERSION`
4. Push the commit and the tag
`git push origin --tags`
5. Archive Brisk in Xcode, export without re-signing (last option)
6. Create a tar.gz from the archived Glancify.app
`tar -pvczf Glancify.app.tar.gz Glancify.app`
7. Get sha of archive
`shasum -a 256 Glancify.app.tar.gz`
8. Draft a release on GitHub with the newly pushed tag. Title the release based on whatever feature / bugfix is "most important"
9. At the bottom of the description include the output of shasum from the previous step in triple backticks
10. Upload Glancify.app.tar.gz to the release
11. Save / create the release
12. In the appcast.xml, duplicate the top item, and paste it above
13. Change the title, enclosure url, sparkle:version, releaseNotesLink url to the new version
14. Replace length with the size of the new Glancify.app.tar.gz 
`stat -f "%z" Glancify.app.tar.gz`
15. Sign the release 
`path/to/glancify/Pods/Sparkle/bin/sign_update Glancify.app.tar.gz path/to/dsa_priv.pem`
16. Replace `sparkle:dsaSignature` with that
17 Update the pubDate with current date 
`date +"%a, %d %b %G %H:%M:%S %z"`
18. Commit the appcast changes 
`git commit -am "Update appcast for $VERSION"`
19. Checkout master and merge develop
`git checkout master`
`git merge develop`
20. Push to master and develop
`git push`
`git checkout develop`
`git push` 
20. Add a new master section in the CHANGELOG.md for future changes and commit it
