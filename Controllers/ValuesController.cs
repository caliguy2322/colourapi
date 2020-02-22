using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using ColourAPI.Models;

namespace ColourAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ValuesController : ControllerBase
    {

        private readonly ColourContext _context;
        public ValuesController(ColourContext context)
        {
            _context = context;
        }

        // GET api/values
        [HttpGet]
        public ActionResult<IEnumerable<Colour>> GetColourItems()
        {
            return _context.ColourItems;
        }


    }
}
