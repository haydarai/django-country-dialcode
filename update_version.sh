#
# Usage:
#   ./update_version.sh 0.5.2
#

git flow release start v$1
sed -i -e "s/__version__ = '.*'/__version__ = '$1'/g" country_dialcode/__init__.py
sed -i -e "s/version = '.*'/version = '$1'/g" docs/source/conf.py
#rm -rf docs/html
#python setup.py develop
#make docs
#git commit docs country_dialcode/__init__.py -m "Update to version v$1"
git commit -a -m "Update to version v$1"
git flow release finish v$1
python setup.py sdist upload -r pypi
