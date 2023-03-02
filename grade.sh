CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
cd student-submission


if [[ -f ListExamples.java ]]
then 
    echo "ListExamples found"
else 
    echo "ListExamples.java missing"
    exit 1
fi

cp ../TestListExamples.java ./
javac -cp .:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar *.java > javac-errors.txt
if [[ $? -eq 0 ]]
then 
    echo "Success Compile"
else
    echo "Failed Compile"
fi

java -cp .:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples > results.txt

cat results.txt
echo 'Done cloning'

cp student-submission/ListExamples.java ./
javac -cp $CPATH *.java
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples
