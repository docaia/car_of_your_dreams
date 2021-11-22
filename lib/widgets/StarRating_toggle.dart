class StarRatingToggle{
  StarRatingToggle({this.isChecked=false});
  bool isChecked;
  void ratingToggle(){
    isChecked = !isChecked;
}
bool ratingToggleForDependability(depIsChecked){
    depIsChecked = !depIsChecked;
    return depIsChecked;
}
}