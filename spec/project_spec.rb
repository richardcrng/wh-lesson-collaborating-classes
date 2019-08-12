describe 'Creating labs and courses' do
  describe 'GIVEN a title and description' do
    title = 'My new lesson'
    description = 'It is going to teach some things'

    describe 'WHEN lab = Lab.new(title, description)' do
      lab = Lab.new(title, description)

      it 'THEN lab#title is equal to the passed in title' do
        expect(lab.title).to eq(title)
      end

      it 'AND lab#description is equal to the passed in description' do
        expect(lab.description).to eq(description)
      end

      it 'AND Lab.all includes lab' do
        expect(Lab.all).to include(lab)
      end
    end
  end

  describe 'GIVEN three lab objects, lab_1, lab_2 and lab_3' do
    lab_1 = Lab.new('Learn Git', 'We are going to learn Git')
    lab_2 = Lab.new('Learn Ruby', 'We are going to learn Ruby')
    lab_3 = Lab.new('Learn JavaScript', 'We are going to learn JavaScript')

    describe 'WHEN course = Course.new([lab_1, lab_2, lab_3])' do
      course = Course.new([lab_1, lab_2, lab_3])

      it 'THEN course#labs is equal to an array of the labs' do
        expect(course.labs).to eq([lab_1, lab_2, lab_3])
      end

      it "AND lab_1#courses is an array containing the course" do
        expect(lab_1.courses).to include(course)
      end

      it "AND Course.all includes course" do
        expect(Course.all).to include(course)
      end

      describe 'AND we create a new lab' do
      lab = Lab.new('Lab title', 'Lab description')

        it "THEN course#add_lab adds the lab to the course" do
          course.add_lab(lab)
          expect(course.labs).to include(lab)
        end
      end
    end
  end
end

describe 'Creating students and cohorts' do
  describe 'GIVEN first_name and last_name' do
    first_name = 'Joe'
    last_name = 'Bloggs'

    describe 'WHEN student = Student.new(first_name, last_name)' do
      student = Student.new(first_name, last_name)

      it 'THEN student#first_name is equal to first_name' do
        expect(student.first_name).to eq(first_name)
      end

      it 'AND student#last_name is equal to last_name' do
        expect(student.last_name).to eq(last_name)
      end

      it 'AND student#name is equal to first_name last_name' do
        expect(student.name).to eq("#{first_name} #{last_name}")
      end

      it 'AND Student.all includes student' do
        expect(Student.all).to include(student)
      end
    end
  end

  describe 'GIVEN three students, student_1, student_2 and student_3' do
    student_1 = Student.new('Joe', 'Bloggs')
    student_2 = Student.new('Taylor', 'Swift')
    student_3 = Student.new('Lionel', 'Messi')

    describe 'WHEN cohort = Cohort.new([student_1, student_2, student_3])' do
      cohort = Cohort.new([student_1, student_2, student_3])

      it 'THEN cohort.students is an array of the students' do
        expect(cohort.students).to eq([student_1, student_2, student_3])
      end

      it 'THEN Cohort.all includes cohort' do
        expect(Cohort.all).to include(cohort)
      end

      describe 'AND a fourth student, student_4' do
        student_4 = Student.new('Sansa', 'Stark')
        
        it 'THEN cohort#add_student(student_4) adds student_4 to the cohort' do
          cohort.add_student(student_4)
          expect(cohort.students).to include(student_4)
          expect(cohort.students.size).to eq(4)
        end
      end
    end
  end
end

describe 'Assigning courses/labs to cohorts/students' do
  describe 'GIVEN three labs and a course made from them' do
    lab_1 = Lab.new('Learn Git', "We will learn Git")
    lab_2 = Lab.new('Learn Ruby', "We will learn Ruby")
    lab_3 = Lab.new('Learn JavaScript', "We will learn JavaScript")
    course = Course.new([lab_1, lab_2, lab_3])

    describe 'AND three students and a cohort made from them' do
      student_1 = Student.new('Joe', 'Bloggs')
      student_2 = Student.new('Taylor', 'Swift')
      student_3 = Student.new('Lionel', 'Messi')
      cohort = Cohort.new([student_1, student_2, student_3])

      describe 'WHEN cohort#assign_course(course)' do
        cohort.assign_course(course)

        it 'THEN lab_1#students includes all three students' do
          expect(lab_1.students).to include(student_1)
          expect(lab_1.students).to include(student_2)
          expect(lab_1.students).to include(student_3)
        end

        it 'AND student_1#labs includes all three students' do
          expect(student_1.labs).to include(lab_1)
          expect(student_1.labs).to include(lab_2)
          expect(student_1.labs).to include(lab_3)
        end

        it 'AND lab_1#student_completion is a hash keyed by student object_id and values of false by default' do
          expect(lab_1.student_completion).to eq({
            student_1.object_id => false,
            student_2.object_id => false,
            student_3.object_id => false
          })
        end

        it 'AND course#student_completion is a hash keyed by student object_id and values of false by default' do
          expect(course.student_completion).to eq({
            student_1.object_id => false,
            student_2.object_id => false,
            student_3.object_id => false
          })
        end

        describe 'AND student_1#complete_lab(lab_1)' do
          before(:each) do
            student_1.complete_lab(lab_1)
          end

          it 'THEN lab_1#student_completion[student_1.object_id] == true' do
            expect(lab_1.student_completion[student_1.object_id]).to be true
          end

          describe 'AND student_1#complete(lab_2), student_1#complete(lab_2)' do
            before(:each) do
              student_1.complete_lab(lab_2)
              student_1.complete_lab(lab_3)
            end

            it 'THEN course#student_completion[student_1.object_id] == true' do
              expect(course.student_completion[student_1.object_id]).to be true
            end
          end
        end
      end
    end
  end
end
