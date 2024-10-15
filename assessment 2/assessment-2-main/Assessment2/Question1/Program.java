import java.util.Scanner;

class Insurance {
    private String insuranceNo;
    private String insuranceName;
    private double amountCovered;

    public String getInsuranceNo() { return insuranceNo; }
    public void setInsuranceNo(String insuranceNo) { this.insuranceNo = insuranceNo; }
    public String getInsuranceName() { return insuranceName; }
    public void setInsuranceName(String insuranceName) { this.insuranceName = insuranceName; }
    public double getAmountCovered() { return amountCovered; }
    public void setAmountCovered(double amountCovered) { this.amountCovered = amountCovered; }
}

class MotorInsurance extends Insurance {
    private float depPercent;

    public float getDepPercent() { return depPercent; }
    public void setDepPercent(float depPercent) { this.depPercent = depPercent; }

    public double calculatePremium() {
        double idv = getAmountCovered() - (getAmountCovered() * depPercent / 100);
        return 0.03 * idv;
    }
}

class LifeInsurance extends Insurance {
    private int policyTerm;
    private float benefitPercent;

    public int getPolicyTerm() { return policyTerm; }
    public void setPolicyTerm(int policyTerm) { this.policyTerm = policyTerm; }
    public float getBenefitPercent() { return benefitPercent; }
    public void setBenefitPercent(float benefitPercent) { this.benefitPercent = benefitPercent; }

    public double calculatePremium() {
        return (getAmountCovered() - (getAmountCovered() * benefitPercent / 100)) / policyTerm;
    }
}

public class Program {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Insurance Number: ");
        String insuranceNo = scanner.nextLine();

        System.out.print("Insurance Name: ");
        String insuranceName = scanner.nextLine();

        System.out.print("Amount Covered: ");
        double amountCovered = scanner.nextDouble();

        System.out.println("Select\n1. Life Insurance\n2. Motor Insurance");
        int option = scanner.nextInt();

        Insurance insurance;
        double premium;

        if (option == 1) {
            LifeInsurance lifeInsurance = new LifeInsurance();
            lifeInsurance.setInsuranceNo(insuranceNo);
            lifeInsurance.setInsuranceName(insuranceName);
            lifeInsurance.setAmountCovered(amountCovered);

            System.out.print("Policy Term: ");
            lifeInsurance.setPolicyTerm(scanner.nextInt());

            System.out.print("Benefit Percent: ");
            lifeInsurance.setBenefitPercent(scanner.nextFloat());

            premium = lifeInsurance.calculatePremium();
        } else {
            MotorInsurance motorInsurance = new MotorInsurance();
            motorInsurance.setInsuranceNo(insuranceNo);
            motorInsurance.setInsuranceName(insuranceName);
            motorInsurance.setAmountCovered(amountCovered);

            System.out.print("Depreciation Percent: ");
            motorInsurance.setDepPercent(scanner.nextFloat());

            premium = motorInsurance.calculatePremium();
        }

        System.out.println("Calculated Premium: " + premium);
    }
}
