package by.belstu.it.markovich.ITCompany;

import java.util.List;

public class Company {
     public List<Person> staff;

     public Computers comps;

     public Company(List<Person> staff) {
          this.staff = staff;
     }

     public void AddEmployee(Person person){           //добавить работника
          this.staff.add(person);
     }

     public void RemoveEmployee(Person person){        //уволить работника
          this.staff.remove(person);
     }

     public void СhangeEmployeePosition(Person person,position pos){       //изменить должность работника
          try{
               if(this.staff.contains(person)){
                    person.pos = pos;
               }
               else{
                    throw new Exception("Попытка изменить должность не нанятого работника");
               }
          }
          catch(Exception ex){
               System.out.println(ex.getMessage());
          }
     }

     public void GetStaffList(){            //вывод списка сотрудников
          for(int i = 0; i < this.staff.size(); i++){
               System.out.println(this.staff.get(i).name + " " + this.staff.get(i).pos + " " +  this.staff.get(i).age);
               System.out.println("--------------------------");
          }
     }

     public boolean CheckPlanSet(List<position> PlanSet){  //проверка на соответствие персонала списку
          boolean checkkey;
          int j;
          for(int i = 0; i < PlanSet.size(); i++) {
               checkkey = false;


               for (j = 0; j < this.staff.size(); j++) {
                    if (this.staff.get(j).pos == PlanSet.get(i)) {
                         checkkey = true;
                    }
               }

               if (checkkey == false) {
                    return false;
               }
          }
          return true;
     }

     public void SortBySalary(int minprice,int maxprice){                     // сортировка по зарплате

          System.out.println("работники с зарплатой от " + minprice + " до " + maxprice + ":");
          System.out.println("--------------------------");
          for(int i = 0 ; i < this.staff.size(); i++){
               if (this.staff.get(i).salary < maxprice && this.staff.get(i).salary > minprice){
                    System.out.println(this.staff.get(i).name + " " + this.staff.get(i).pos + " "
                            +  this.staff.get(i).age + " --- " + this.staff.get(i).salary);
                    System.out.println("--------------------------");
               }
          }
     }

     public void SearchByPos(position pos){
          System.out.println("работники c квалификацией " + pos + " : ");
          System.out.println("--------------------------");
          for(int i = 0 ; i < this.staff.size(); i++){
               if (this.staff.get(i).pos == pos){
                    System.out.println(this.staff.get(i).name + " " + this.staff.get(i).pos + " " +  this.staff.get(i).age);
                    System.out.println("--------------------------");
               }
          }
     }

     public int  GetStaffAmount(){

          return this.staff.size();
     }


}
