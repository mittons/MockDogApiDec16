using Microsoft.AspNetCore.Mvc;
using testWebApi.Models;

namespace MockDogApiDec16.Controllers;

[ApiController]
[Route("[controller]")]
public class BreedsController : ControllerBase
{
    private readonly BreedService _breedService;

    public BreedsController()
    {
        _breedService = new BreedService();
    }

    [HttpGet]
    public IEnumerable<Breed> Get()
    {
        return _breedService.GetBreeds();
    }
}
