library(dplyr)

# Import and read the MechaCar_mpg.csv file
mechacar_table <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

# Generate multiple linear regression model
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mechacar_table)

# Generate Summary statistical metrics
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mechacar_table))


# Import and read the Suspension_Coil.csv file
suspension_coil_table <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)

# Create a total_summary dataframe using summarize()
total_summary <- suspension_coil_table %>%
  summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI))


# Create a lot_summary dataframe using group_by()
lot_summary <- suspension_coil_table %>% group_by(Manufacturing_Lot) %>% 
  summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep')


# Create a t-test to compare PSI across all lots versus population mean of 1500
t.test(suspension_coil_table$PSI,mu=1500)


# Create subsets for the different manufacturing lots
lot1_subset <- suspension_coil_table %>% subset(Manufacturing_Lot == 'Lot1')
lot2_subset <- suspension_coil_table %>% subset(Manufacturing_Lot == 'Lot2')
lot3_subset <- suspension_coil_table %>% subset(Manufacturing_Lot == 'Lot3')


# Create a t-test to compare lot1_subset PSI versus population mean of 1500
t.test(lot1_subset$PSI,mu=1500)

# Create a t-test to compare lot2_subset PSI versus population mean of 1500
t.test(lot2_subset$PSI,mu=1500)

# Create a t-test to compare lot3_subset PSI versus population mean of 1500
t.test(lot3_subset$PSI,mu=1500)