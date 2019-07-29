rm -rf .git

git init

git config --global user.name "稗田 奈间"
git config --global user.email "HiedaNaKan@kurumi.io"
git config credential.helper store

git remote add origin https://github.com/HiedaNaKan/ntt_manual

git add .

if [ ! $1 ]; then

  git commit -m "喵"
  
else

  git commit -m $1
  
fi

git push origin master --force