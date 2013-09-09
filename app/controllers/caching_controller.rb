class CachingController < ApplicationController
  
  def index
    xs = [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7, 1.8, 1.9, 2.0, 2.1, 2.2, 2.3, 2.4, 2.5, 2.6, 2.7, 2.8, 2.9,
         -0.1, -0.2, -0.3, -0.4, -0.5, -0.6, -0.7, -0.8, -0.9, -1.0, -1.1, -1.2, -1.3, -1.4, -1.5, -1.6, -1.7, -1.8, -1.9, -2.0, -2.1, -2.2, -2.3, -2.4, -2.5, -2.6, -2.7, -2.8, -2.9]
    @values = xs.collect do |x|
      sin(x)
    end
  end
  
  def factorial(n)
    Rails.cache.fetch ['factorial', n] do
      if n == 1
        1
      else
        n * factorial(n-1)
      end
    end
  end
  
  def sin(x)
    # Maclaurin series expansion of sin(x) http://en.wikipedia.org/wiki/Taylor_series
    Rails.cache.fetch ['sin' + x.to_s] do
      (0..10).inject(0) do |r, j|
        n = 1 + (j * 2)
        p = x**n / factorial(n)
        s = 1 - ((j % 2) * 2)

        r + (s * p)
      end
    end
  end
  
  add_method_tracer :sin, 'Custom/compute_sine'
end
