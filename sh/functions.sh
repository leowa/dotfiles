function fs()
{
    KEY=$1
    FILEP=$2
    [ -z $2 ] && FILEP='*.*'
    #grep -I -i "$KEY" .  -r --include "$FILEP" | awk -F ':' '{if(a[$1]++==0) print $0}'
    grep -n -I -i "$KEY" .  -r --include "$FILEP" 
}
function fsf()
{
    KEY=$1
    FILEP=$2
    [ -z $2 ] && FILEP='*.*'
    grep -i -I "$KEY" . -r --include "$FILEP" | awk -F ':' '{if(a[$1]++==0) print $1}'
    find . -iname "$KEY"
}
function vif()
{
    KEY=$1
    FILEP=$2
    [ -z $2 ] && FILEP='*.*'
    vim $(grep -I -i "$KEY" .  -r --include "$FILEP" | awk -F ':' '{if(a[$1]++==0) print $1}') +/"$KEY"
}
function title()
{
    TITLE=$1
    [ -z $1 ] && TITLE=`pwd | awk -F '/' '{print $NF}'` 
    echo -n -e "\033];$TITLE\007"
}
function git_add()
{
    git add `git status | awk '/modified/ && NF==2 { print $2 }'`
}

function git_add_a()
{
    git add `git status | awk '/modified/ && NF==2 { print $2 }'`
    git commit --amend
}

function git_add_m()
{
    echo "adding merged files"
    git add `git status -s | grep '^UU ' | grep -v 'repo-deps' | sed 's/^UU //'`
}
function git_add_push()
{
	git_add && git commit --amend && gerrit_push
}
function git_rm()
{
	git status -s | sed -n -e 's/^ D // p' | xargs -I {} git rm {}
}

function git_fix_pc()
{
#now=`date "+DATE: %Y%m%dT%H%M%S" | awk '{print $2}'`
#git status -s | awk '/^[AM]/ { print $2}'| grep -E -v '\.pdb$|\.dll$|\.exe$' > .git_fix_temp
#git status -s | awk '/^[R]/ { print $4}' | grep -E -v '\.pdb$|\.dll$|\.exe$' >> .git_fix_temp
git show | awk '/^diff/' | awk 'match($0,/b\//) {print substr($0,RSTART+2, length($0))}' | grep -E -v '\.pdb$|\.dll$|\.exe$'> .git_fix_temp
cat .git_fix_temp | grep '\.cs' | xargs -I {} chmod a-x {}
cat .git_fix_temp | xargs -I {} dos2unix {}
cat .git_fix_temp | xargs -I {} sed -E -i '' 's/[ ]+$//' {}
cat .git_fix_temp | xargs -I {} vim +'%s/\s\+$//g' +wq {}
rm .git_fix_temp
}
function git_ls_pc()
{
git show | awk '/^diff/' | awk 'match($0,/b\//) {print substr($0,RSTART+2, length($0))}' | grep -E -v '\.pdb$|\.dll$|\.exe$' 
}

function git_ls_new()
{
git status -s | awk '/^\?\? / { print substr($0,RSTART+4,length($0)) }'
}

function git_ls_m()
{
git status -s | awk '/^ M/ { print substr($0,RSTART+4,length($0)) }' | grep -v 'repo-deps'
}

function git_ue_m()
{
 git status -s | sed -n 's/^[ ]M[ ]// p' | grep -v '\(dll\|exe\|pdb\)$' | xargs -I {} dos2unix {} 
}
function git_ue_new()
{
  git status -s | sed -n 's/^?? //p' | xargs -I {} dos2unix {}
}
function git_ue_mm()
{
 git status -s | sed -n 's/^M  // p' | grep -v '\(dll\|exe\|pdb\)$' | xargs -I {} dos2unix {} 
}

function git_p()
{
 git status -s | sed -n 's/^ [AM][AM]* // p' | grep -v '\(dll\|exe\|pdb\)$'
}

function git_trim_m()
{
	git status -s | sed -n 's/^[ ]M[ ]// p' | grep -v '\(dll\|exe\|pdb\)$' | xargs -I {} sed -E -i -e '' 's/[\t ]+$//' {}
}

function git_trim()
{
   sed -E -i -e 's/[ ]+$//' $1
}

function gerrit_push()
{
	git pull --rebase;gerrit push
}


# function md()
# {
#     /Applications/MacDown.app/Contents/MacOS/MacDown $@ &
# }
# 
function stopvm()
{
    vboxmanage list vms | grep $1 | awk '{print $2}' | xargs -I {} vboxmanage controlvm {} savestate 
}
function startvm()
{
    vboxmanage list vms | grep $1 | awk '{print $2}' | xargs -I {} vboxmanage startvm {} --type headless
}

# Build go source code after running go fmt for all go source code
function gb()
{
    find . -name "*.go" | awk '$0 !~ /vendor\//{ system("gofmt -w $CWD"$0)}'
    go build
}

function java_pom()
{
	mvn archetype:generate -DgroupId=$1  -DartifactId=$2 -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4 -DinteractiveMode=false
}

function lns(){
alias ns="kubectl -n default exec -it `kubectl -n default get po -l run=netshoot -ojsonpath='{.items[0].metadata.name}'` -- "
}

function lkapi(){
export APISERVER=$(kubectl config view -o jsonpath="{.clusters[?(@.name==\"$1\")].cluster.server}")
TOKEN=$(kubectl -n kube-system get secrets -o jsonpath="{.items[?(@.metadata.annotations['kubernetes\.io/service-account\.name']=='tiller')].data.token}"|base64 --decode)
alias kapi="curl --header \"Authorization: Bearer $TOKEN\" --insecure"
}


# list ec2 instances filter by its name
function ec2() {
 aws ec2 describe-instances --output table --filters "Name=tag:Name,Values=*$1*"  --query 'Reservations[*].Instances[*].[Tags[?Key==`Name`].Value|[0],PrivateIpAddress, InstanceType]|sort_by([],&[0])'
}

function qec2() {
 aws ec2 describe-instances --profile QA --output table --filters "Name=tag:Name,Values=*$1*"  --query 'Reservations[*].Instances[*].[Tags[?Key==`Name`].Value|[0],PrivateIpAddress, InstanceType]|sort_by([],&[0])'
}

function zec2() {
 aws ec2 describe-instances --profile zhy --output table --filters "Name=tag:Name,Values=*$1*"  --query 'Reservations[*].Instances[*].[Tags[?Key==`Name`].Value|[0],PrivateIpAddress, InstanceType]|sort_by([],&[0])'
}

# describe AWS ENI provided its private IP address
function eni() {
aws ec2 describe-network-interfaces --query 'NetworkInterfaces[*].[join(`: `,[PrivateIpAddress,(TagSet[?Key==`Name`].Value[0] || Description)])]|[]|[]' --filters "Name=addresses.private-ip-address,Values=*$1*"
}

