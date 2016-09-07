
var SalesTeam = function(employee_array) {
	this.employees = employee_array || []
}



SalesTeam.prototype.find = function(name) {
	// return this.employees.find(firstName === name)
	for(i = 0; i < this.employees.length; i++){
		if(this.employees[i].firstName === name ){
			return this.employees[i]
		}
	}
};

SalesTeam.prototype.topPerformer = function() {
	var highest_preformer = this.employees[0];

	for(var i = 0; i < this.employees.length; i++){
		if (this.employees[i].totalSales() > highest_preformer.totalSales()){
			highest_preformer = this.employees[i]
		}
	}
	return highest_preformer
};

