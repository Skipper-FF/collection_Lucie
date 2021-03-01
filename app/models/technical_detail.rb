class TechnicalDetail < ApplicationRecord
  belongs_to :clothe
  belongs_to :component

  after_save  :compute_component_cost
  
  # private
  def compute_component_cost
  # récuperer le prix du composant lié
    component = self.component
    compoUI = component.unit_price.to_f
    # multiplier par sa propre qté (self)
    price = compoUI * self.quantity
    # récup l'instance associée de clothe
    # incrémenter cette instance du prix total
    clothe = self.clothe
    clothe.total_cost += price
    # save clothe
    clothe.save 
  end
     

end
